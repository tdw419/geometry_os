; DESCRIPTION: Creates a orange rectangular region at (215, 129) spanning 96 by 96 pixels.
; PLAN: r0=215(x), r1=129(y), r2=96(width), r3=96(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 129
LDI r2, 96
LDI r3, 96
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
