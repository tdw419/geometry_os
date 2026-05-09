; DESCRIPTION: Renders a orange box of size 120x16 starting at (164, 103).
; PLAN: r0=164(x), r1=103(y), r2=120(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 103
LDI r2, 120
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
