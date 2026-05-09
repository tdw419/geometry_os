; DESCRIPTION: Renders a orange box of size 87x64 starting at (374, 28).
; PLAN: r0=374(x), r1=28(y), r2=87(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 28
LDI r2, 87
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
