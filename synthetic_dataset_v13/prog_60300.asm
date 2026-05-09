; DESCRIPTION: Renders a orange box of size 63x57 starting at (337, 27).
; PLAN: r0=337(x), r1=27(y), r2=63(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 27
LDI r2, 63
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
