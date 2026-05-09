; DESCRIPTION: Renders a orange box of size 86x30 starting at (80, 117).
; PLAN: r0=80(x), r1=117(y), r2=86(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 117
LDI r2, 86
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
