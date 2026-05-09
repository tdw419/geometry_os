; DESCRIPTION: Draws a cyan line from (322, 116) to (282, 224).
; PLAN: r0=322(x1), r1=116(y1), r2=282(x2), r3=224(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 116
LDI r2, 282
LDI r3, 224
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
