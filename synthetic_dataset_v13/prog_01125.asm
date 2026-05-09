; DESCRIPTION: Renders a orange box of size 55x64 starting at (127, 57).
; PLAN: r0=127(x), r1=57(y), r2=55(width), r3=64(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 57
LDI r2, 55
LDI r3, 64
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
