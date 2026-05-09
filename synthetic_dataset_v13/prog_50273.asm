; DESCRIPTION: Draws a cyan line from (392, 203) to (442, 176).
; PLAN: r0=392(x1), r1=203(y1), r2=442(x2), r3=176(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 203
LDI r2, 442
LDI r3, 176
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
