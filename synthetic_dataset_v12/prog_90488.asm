; DESCRIPTION: Creates a cyan rectangular region at (327, 174) spanning 113 by 24 pixels.
; PLAN: r0=327(x), r1=174(y), r2=113(width), r3=24(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 174
LDI r2, 113
LDI r3, 24
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
