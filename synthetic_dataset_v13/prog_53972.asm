; DESCRIPTION: Draws a green line from (83, 205) to (445, 166).
; PLAN: r0=83(x1), r1=205(y1), r2=445(x2), r3=166(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 205
LDI r2, 445
LDI r3, 166
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
