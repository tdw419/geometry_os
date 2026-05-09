; DESCRIPTION: Creates a cyan rectangular region at (69, 196) spanning 10 by 60 pixels.
; PLAN: r0=69(x), r1=196(y), r2=10(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 196
LDI r2, 10
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
