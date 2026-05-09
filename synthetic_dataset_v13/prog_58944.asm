; DESCRIPTION: Creates a cyan rectangular region at (198, 5) spanning 113 by 54 pixels.
; PLAN: r0=198(x), r1=5(y), r2=113(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 5
LDI r2, 113
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
