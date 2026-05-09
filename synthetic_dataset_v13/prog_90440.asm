; DESCRIPTION: Draws a red rectangle at (401, 245) with width 16 and height 10.
; PLAN: r0=401(x), r1=245(y), r2=16(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 245
LDI r2, 16
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
