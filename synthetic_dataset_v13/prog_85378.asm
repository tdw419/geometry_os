; DESCRIPTION: Creates a cyan rectangular region at (479, 121) spanning 17 by 58 pixels.
; PLAN: r0=479(x), r1=121(y), r2=17(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 121
LDI r2, 17
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
