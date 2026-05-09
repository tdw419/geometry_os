; DESCRIPTION: Draws a green line from (265, 5) to (401, 111).
; PLAN: r0=265(x1), r1=5(y1), r2=401(x2), r3=111(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 5
LDI r2, 401
LDI r3, 111
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
