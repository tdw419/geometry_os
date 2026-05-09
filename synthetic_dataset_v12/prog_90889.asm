; DESCRIPTION: Renders a yellow box of size 21x80 starting at (438, 16).
; PLAN: r0=438(x), r1=16(y), r2=21(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 16
LDI r2, 21
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
