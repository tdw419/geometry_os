; DESCRIPTION: Places a cyan line segment connecting (354, 126) to (482, 13).
; PLAN: r0=354(x1), r1=126(y1), r2=482(x2), r3=13(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 126
LDI r2, 482
LDI r3, 13
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
