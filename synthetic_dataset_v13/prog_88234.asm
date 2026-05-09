; DESCRIPTION: Creates a cyan rectangular region at (284, 71) spanning 49 by 49 pixels.
; PLAN: r0=284(x), r1=71(y), r2=49(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 71
LDI r2, 49
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
