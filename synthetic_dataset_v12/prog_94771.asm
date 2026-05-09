; DESCRIPTION: Renders a orange box of size 75x80 starting at (307, 128).
; PLAN: r0=307(x), r1=128(y), r2=75(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 128
LDI r2, 75
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
