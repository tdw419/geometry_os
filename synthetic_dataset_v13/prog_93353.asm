; DESCRIPTION: Draws a green line from (443, 215) to (320, 12).
; PLAN: r0=443(x1), r1=215(y1), r2=320(x2), r3=12(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 215
LDI r2, 320
LDI r3, 12
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
