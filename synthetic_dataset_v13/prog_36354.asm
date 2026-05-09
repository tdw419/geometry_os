; DESCRIPTION: Creates a cyan rectangular region at (460, 103) spanning 49 by 45 pixels.
; PLAN: r0=460(x), r1=103(y), r2=49(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 460
LDI r1, 103
LDI r2, 49
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
