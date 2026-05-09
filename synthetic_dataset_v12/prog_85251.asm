; DESCRIPTION: Renders a orange box of size 42x90 starting at (249, 146).
; PLAN: r0=249(x), r1=146(y), r2=42(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 146
LDI r2, 42
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
