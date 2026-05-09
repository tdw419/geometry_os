; DESCRIPTION: Renders a green box of size 94x10 starting at (272, 38).
; PLAN: r0=272(x), r1=38(y), r2=94(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 272
LDI r1, 38
LDI r2, 94
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
