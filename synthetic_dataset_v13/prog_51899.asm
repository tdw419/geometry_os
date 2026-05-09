; DESCRIPTION: Renders a orange box of size 67x47 starting at (294, 38).
; PLAN: r0=294(x), r1=38(y), r2=67(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 38
LDI r2, 67
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
