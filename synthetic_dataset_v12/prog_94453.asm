; DESCRIPTION: Creates a cyan rectangular region at (284, 48) spanning 12 by 59 pixels.
; PLAN: r0=284(x), r1=48(y), r2=12(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 284
LDI r1, 48
LDI r2, 12
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
