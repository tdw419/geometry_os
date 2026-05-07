; mixed program
; initialization
  LDI r9, 32
  LDI r6, 2262
  LDI r3, 16
  LDI r2, 0x5643E0
  LDI r10, 8
  LDI r14, 0xD22F00
  LDI r12, 0x3B71F0
  LDI r7, 3827
  SHLI r0, r9, 0x6EF787
  SHR r6, r8, r14
  SHLI r14, r6, 0xF1F7CB
  LDI r15, 2808
  LDI r13, 64
  LDI r14, 0x9AA78A
  WPIXEL
  AND r5, r4, r10
  OR r11, r9, r0
  OR r31, r11, r8
  IKEY r5
  CMPI r5, 0x0D9EBC
  JNZ r5, key_0
  LDI r9, 2622
  STORE r9, r0
  LOAD r1, r9
  LDI r8, 0x1B642C
  STORE r8, r6
  LOAD r0, r8
  LDI r9, 16
  STORE r9, r4
  LOAD r14, r9
  LDI r7, 1864
  STORE r7, r3
  LOAD r15, r7
  LDI r14, 0x87D765
  STORE r14, r6
  LOAD r18, r14
  LDI r0, 0xBFE240
  STORE r0, r0
  LOAD r12, r0
  OR r4, r5, r0
  HALT
