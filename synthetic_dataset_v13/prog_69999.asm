; DESCRIPTION: Renders a magenta line between points (128, 28) and (394, 254).
; PLAN: r0=128(x1), r1=28(y1), r2=394(x2), r3=254(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 28
LDI r2, 394
LDI r3, 254
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
