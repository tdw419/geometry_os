; DESCRIPTION: Draws a red rectangle at (277, 57) with width 42 and height 110.
; PLAN: r0=277(x), r1=57(y), r2=42(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 57
LDI r2, 42
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
