; DESCRIPTION: Creates a cyan rectangular region at (284, 43) spanning 19 by 100 pixels.
; PLAN: r0=284(x), r1=43(y), r2=19(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 43
LDI r2, 19
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
