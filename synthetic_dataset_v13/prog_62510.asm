; DESCRIPTION: Places a black line segment connecting (224, 190) to (479, 174).
; PLAN: r0=224(x1), r1=190(y1), r2=479(x2), r3=174(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 190
LDI r2, 479
LDI r3, 174
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
