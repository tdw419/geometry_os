; DESCRIPTION: Creates a cyan rectangular region at (39, 164) spanning 43 by 45 pixels.
; PLAN: r0=39(x), r1=164(y), r2=43(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 164
LDI r2, 43
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
