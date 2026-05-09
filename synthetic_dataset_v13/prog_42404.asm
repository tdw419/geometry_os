; DESCRIPTION: Draws a red rectangle at (275, 107) with width 50 and height 64.
; PLAN: r0=275(x), r1=107(y), r2=50(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 107
LDI r2, 50
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
