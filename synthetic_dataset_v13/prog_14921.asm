; DESCRIPTION: Creates a cyan rectangular region at (284, 180) spanning 74 by 33 pixels.
; PLAN: r0=284(x), r1=180(y), r2=74(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 180
LDI r2, 74
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
