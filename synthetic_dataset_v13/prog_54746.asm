; DESCRIPTION: Draws a cyan line from (439, 224) to (209, 83).
; PLAN: r0=439(x1), r1=224(y1), r2=209(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 224
LDI r2, 209
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
