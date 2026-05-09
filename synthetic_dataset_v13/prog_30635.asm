; DESCRIPTION: Renders a cyan line between points (65, 228) and (210, 57).
; PLAN: r0=65(x1), r1=228(y1), r2=210(x2), r3=57(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 228
LDI r2, 210
LDI r3, 57
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
