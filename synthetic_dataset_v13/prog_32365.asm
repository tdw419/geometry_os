; DESCRIPTION: Composite: Creates a cyan circular shape at (231, 152) with radius 66 then Creates a cyan rectangular region at (205, 168) spanning 120 by 32 pixels.
; PLAN: r0=231(x), r1=152(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=205(x), r6=168(y), r7=120(width), r8=32(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 231
LDI r1, 152
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 205
LDI r6, 168
LDI r7, 120
LDI r8, 32
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
