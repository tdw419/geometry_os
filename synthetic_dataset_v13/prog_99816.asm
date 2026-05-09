; DESCRIPTION: Creates a cyan rectangular region at (146, 69) spanning 38 by 16 pixels.
; PLAN: r0=146(x), r1=69(y), r2=38(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 69
LDI r2, 38
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
