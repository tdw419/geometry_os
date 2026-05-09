; DESCRIPTION: Draws a cyan line from (442, 231) to (482, 55).
; PLAN: r0=442(x1), r1=231(y1), r2=482(x2), r3=55(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 231
LDI r2, 482
LDI r3, 55
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
