; DESCRIPTION: Renders a orange box of size 46x73 starting at (284, 36).
; PLAN: r0=284(x), r1=36(y), r2=46(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 36
LDI r2, 46
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
