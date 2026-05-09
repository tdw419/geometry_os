; DESCRIPTION: Renders a orange box of size 103x18 starting at (284, 74).
; PLAN: r0=284(x), r1=74(y), r2=103(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 74
LDI r2, 103
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
