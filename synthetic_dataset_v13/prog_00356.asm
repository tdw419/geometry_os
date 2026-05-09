; DESCRIPTION: Renders a cyan box of size 85x10 starting at (203, 244).
; PLAN: r0=203(x), r1=244(y), r2=85(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 244
LDI r2, 85
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
