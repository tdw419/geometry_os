; DESCRIPTION: Renders a orange box of size 33x64 starting at (454, 182).
; PLAN: r0=454(x), r1=182(y), r2=33(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 454
LDI r1, 182
LDI r2, 33
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
