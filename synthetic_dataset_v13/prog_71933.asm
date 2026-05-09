; DESCRIPTION: Draws a cyan line from (320, 83) to (42, 140).
; PLAN: r0=320(x1), r1=83(y1), r2=42(x2), r3=140(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 83
LDI r2, 42
LDI r3, 140
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
