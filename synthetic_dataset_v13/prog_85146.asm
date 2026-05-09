; DESCRIPTION: Draws a white line from (20, 65) to (487, 111).
; PLAN: r0=20(x1), r1=65(y1), r2=487(x2), r3=111(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 65
LDI r2, 487
LDI r3, 111
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
