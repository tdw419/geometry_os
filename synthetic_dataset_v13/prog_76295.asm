; DESCRIPTION: Creates a cyan rectangular region at (332, 186) spanning 111 by 50 pixels.
; PLAN: r0=332(x), r1=186(y), r2=111(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 186
LDI r2, 111
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
