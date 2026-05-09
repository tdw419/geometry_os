; DESCRIPTION: Creates a cyan rectangular region at (206, 73) spanning 54 by 111 pixels.
; PLAN: r0=206(x), r1=73(y), r2=54(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 73
LDI r2, 54
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
