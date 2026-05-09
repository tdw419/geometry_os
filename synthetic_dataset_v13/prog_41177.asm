; DESCRIPTION: Draws a cyan line from (224, 208) to (408, 55).
; PLAN: r0=224(x1), r1=208(y1), r2=408(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 208
LDI r2, 408
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
