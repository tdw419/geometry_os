; DESCRIPTION: Creates a cyan rectangular region at (92, 126) spanning 67 by 104 pixels.
; PLAN: r0=92(x), r1=126(y), r2=67(width), r3=104(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 126
LDI r2, 67
LDI r3, 104
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
