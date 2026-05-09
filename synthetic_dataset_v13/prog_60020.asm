; DESCRIPTION: Creates a red rectangular region at (16, 98) spanning 67 by 45 pixels.
; PLAN: r0=16(x), r1=98(y), r2=67(width), r3=45(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 98
LDI r2, 67
LDI r3, 45
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
