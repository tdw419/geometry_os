; DESCRIPTION: Creates a cyan rectangular region at (258, 129) spanning 42 by 25 pixels.
; PLAN: r0=258(x), r1=129(y), r2=42(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 129
LDI r2, 42
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
