; DESCRIPTION: Renders a cyan line between points (337, 128) and (376, 107).
; PLAN: r0=337(x1), r1=128(y1), r2=376(x2), r3=107(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 128
LDI r2, 376
LDI r3, 107
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
