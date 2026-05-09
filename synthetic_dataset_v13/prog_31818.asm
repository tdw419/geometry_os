; DESCRIPTION: Renders a cyan line between points (188, 164) and (114, 42).
; PLAN: r0=188(x1), r1=164(y1), r2=114(x2), r3=42(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 164
LDI r2, 114
LDI r3, 42
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
