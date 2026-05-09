; DESCRIPTION: Draws a cyan line from (69, 224) to (256, 221).
; PLAN: r0=69(x1), r1=224(y1), r2=256(x2), r3=221(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 224
LDI r2, 256
LDI r3, 221
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
