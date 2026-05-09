; DESCRIPTION: Draws a cyan line from (346, 252) to (469, 160).
; PLAN: r0=346(x1), r1=252(y1), r2=469(x2), r3=160(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 252
LDI r2, 469
LDI r3, 160
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
