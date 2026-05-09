; DESCRIPTION: Renders a white line between points (405, 221) and (91, 228).
; PLAN: r0=405(x1), r1=221(y1), r2=91(x2), r3=228(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 221
LDI r2, 91
LDI r3, 228
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
