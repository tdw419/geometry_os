; DESCRIPTION: Composite: Places a orange circle of radius 24 at center (27, 152) then Places a cyan 70x102 rectangle at position (27, 117).
; PLAN: r0=27(x), r1=152(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=27(x), r6=117(y), r7=70(width), r8=102(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 27
LDI r1, 152
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 27
LDI r6, 117
LDI r7, 70
LDI r8, 102
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
