; DESCRIPTION: Renders a cyan line between points (178, 211) and (214, 228).
; PLAN: r0=178(x1), r1=211(y1), r2=214(x2), r3=228(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 211
LDI r2, 214
LDI r3, 228
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
