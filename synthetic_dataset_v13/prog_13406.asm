; DESCRIPTION: Renders a black line between points (382, 86) and (198, 42).
; PLAN: r0=382(x1), r1=86(y1), r2=198(x2), r3=42(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 86
LDI r2, 198
LDI r3, 42
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
